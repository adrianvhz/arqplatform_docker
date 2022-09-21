import { Sequelize, DataTypes, Model, InferAttributes, InferCreationAttributes, Optional } from 'sequelize';
import  mariaDB  from './../../config/dbMariaDb';
import { PlanesI  } from '../../interfaces/plan';

export interface UserIpunt extends Optional<PlanesI, 'id'> {}
export interface UserOuput extends Optional<PlanesI, 'id'> {}

class Planes extends Model
<InferAttributes<Planes>, InferCreationAttributes<Planes>> implements PlanesI
   {
    id!: number;
    descripcion!: string;
    vigencia!: number;
    precio!: number;
    defecto!: number; 
    estado!: number;
    createdAt?: Date
    updatedAt?: Date 
    deletedAt?: Date 

   }

Planes.init({
    id: { 
      type: DataTypes.INTEGER.UNSIGNED,
      autoIncrement: true
      ,primaryKey: true},
    descripcion: {type: DataTypes.STRING, allowNull: false},
    vigencia: {type: DataTypes.NUMBER, allowNull: false},
    precio: {type: DataTypes.NUMBER, allowNull: false},
    defecto: {type: DataTypes.NUMBER, allowNull: false},
    estado: {type: DataTypes.NUMBER, allowNull: false},
    createdAt: {type: DataTypes.DATE,defaultValue: DataTypes.NOW },
    updatedAt: {type: DataTypes.DATE } ,
    deletedAt: {type: DataTypes.DATE } ,
},
  {
    sequelize: mariaDB,
    tableName: 'planes',

  })

  export default Planes;