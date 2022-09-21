import { Sequelize, DataTypes, Model, InferAttributes, InferCreationAttributes, Optional } from 'sequelize';
import  mariaDB  from './../../config/dbMariaDb';
import {  PermisoI } from '../../interfaces/permiso';


export interface UserIpunt extends Optional<PermisoI, 'id'> {}
export interface UserOuput extends Optional<PermisoI, 'id'> {}

class Permiso extends Model
<InferAttributes<Permiso>, InferCreationAttributes<Permiso>> implements PermisoI
   {
    id!: number;
    descripcion!: string;
    estado!: number;
    createdAt?: Date
    updatedAt?: Date 
    deletedAt?: Date 

   }

   Permiso.init({
    id: { type: DataTypes.INTEGER.UNSIGNED,autoIncrement: true,primaryKey: true},
    descripcion: {type: DataTypes.STRING, allowNull: false},
    estado: {type: DataTypes.NUMBER, allowNull: false},
    createdAt: {type: DataTypes.DATE,defaultValue: DataTypes.NOW },
    updatedAt: {type: DataTypes.DATE } ,
    deletedAt: {type: DataTypes.DATE } ,
},
  {
    sequelize: mariaDB,
    tableName: 'permisos',

  })

  export default Permiso;