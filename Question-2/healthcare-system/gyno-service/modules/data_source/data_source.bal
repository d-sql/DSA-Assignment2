import ballerinax/mongodb;

public mongodb:ConnectionConfig mongoConfig = {
    connection: {
        host: "localhost",//HOST,
        port: 27017,//PORT,
        auth: {
            username: "",//DB_USERNAME,
            password: ""//DB_PASSWORD
        },
        options: {
            sslEnabled: false, 
            serverSelectionTimeout: 5000
        }
    },
    databaseName: ""//DATABASE_NAME
};


