import {
  DataTypes,
  Model,
  InferAttributes,
  InferCreationAttributes,
  Optional,
} from 'sequelize';
import mariaDB from './../../config/dbMariaDb';
import { UserI } from '../../interfaces/user';

export interface UserIpunt extends Optional<UserI, 'id'> {}
export interface UserOuput extends Optional<UserI, 'id'> {}

class User extends Model
<InferAttributes<User>, InferCreationAttributes<User>> implements UserI 
 {
  public id!: number;
  public name!: string;
  public lastname!: string;
  public email!: string;
  public password!: string;
  public image?: string;
  public sex!: number;
  public profile_id!: number;
  public createdAt?: Date;
  public updatedAt?: Date;
  public deleted_at?: Date;
  
 }

 User.init({
  id:{ type: DataTypes.INTEGER.UNSIGNED,autoIncrement: true,primaryKey: true},
  name : {type: DataTypes.STRING, allowNull: false},
  lastname:  {type: DataTypes.STRING ,allowNull: false},
  email : {type: DataTypes.STRING,allowNull: false },
  password : {type: DataTypes.STRING,allowNull: false },
  image : {type: DataTypes.STRING },
  sex: {
	  type: new DataTypes.CHAR({ length: 1 }),
    defaultValue: "M"
	},
  profile_id: {
    type: new DataTypes.INTEGER({ length: 11, unsigned: true }),
    allowNull: false
  },
  createdAt :  {type: DataTypes.DATE,defaultValue: DataTypes.NOW },
  updatedAt :  {type: DataTypes.DATE} ,
  deleted_at :  {type: DataTypes.DATE}
 },
  {
    sequelize: mariaDB,
    tableName: 'users',
	underscored: true
  }
 )

 User.prototype.toJSON =  function () {
  const user : UserI = Object.assign({}, this.get());

  delete user.password 
  
  return user;
}
 export default User;
