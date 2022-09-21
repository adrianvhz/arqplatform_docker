import dotenv from "dotenv"; 
dotenv.config();
import Server from "./config/server";
import DataBaseMongo  from "./config/dbMongo";
import DataBaseMariaDb from "./config/dbMariaDb";

const server = new Server();
server.listen();
