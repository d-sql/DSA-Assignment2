# Microservices
## Description
In this project, we're working on a part of a bigger healthcare system. Our part of the system includes a health admin service and various specialist services like dermatology,
gastroenterology, gynaecology, and more. We're only focusing on situations where a patient needs to see a specialist.

### Here's how it works:
1. When a patient needs medical help from a specialist, they send a request to the health
admin service. In this request, they specify which specialist they want to see, when they're
available, and their personal information like first name, last name, and phone number.
2. Once the health admin service gets the request, it talks to the different specialist services
to find an appointment for the patient. Sometimes, the specialist services might need to talk
to each other to figure out the best schedule.
3. When all the appointments are set, the health admin service sends all the details back to
the patient in response.
Your job is to create and set up this healthcare sub-system.
###  Important things to note:
1. You are required to adopt a microservice architectural style to design the distributed
system. (i.e admin service and 3 other specialist services of your choice).
2. Use a Kafka instance to support the communication between a client and your
service(s).
3. Use data stores like (MongoDB or SQL) to store patient information and
appointments.
4. Finally, each service will be deployed in a Docker container.
## Evaluation criteria
- Setup of the Kafka cluster, including topic management. **(15 marks)**
- Setup of the MongoDB/SQL instance. **(5 marks)**
- Docker container configuration. **(5 marks)**
- Implementation of the client and services in the Ballerina language. **(25 marks)**