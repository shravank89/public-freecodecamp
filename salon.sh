#! /bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
if [[ $1 ]]
then
  echo -e "\n$1"
fi
echo -e "Welcome to My Salon, how can I help you?\n"
#get available services
ALL_SERVICES=$($PSQL "SELECT * from services")
echo "$ALL_SERVICES" | while read SERVICE_ID BAR SERVICE
do
echo "$SERVICE_ID) $SERVICE"
done
SERVICE_MENU
}

SERVICE_MENU() {
read SERVICE_ID_SELECTED
SERVICE_NEEDED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

if [[ -z $SERVICE_NEEDED ]]
then
  #send to MAIN_MENU
  MAIN_MENU "I could not find that service. What would you like today?"
else
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  #if customer does not exist
  if [[ -z $CUSTOMER_NAME ]]
  then
    #get new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    #insert new customer 
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi

#get customer id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

#get time to avail service
echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
read SERVICE_TIME

#insert appointments
INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

#final message
echo -e "\nI have put you down for a $SERVICE_NEEDED at $SERVICE_TIME, $CUSTOMER_NAME."

fi
}
MAIN_MENU