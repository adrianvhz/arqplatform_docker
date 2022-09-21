import { DataTypes, Model, InferAttributes, InferCreationAttributes, Optional } from 'sequelize';
import mariaDB from './../../config/dbMariaDb';
import { ZonesI } from '../../interfaces/zones';

export interface UserIpunt extends Optional<ZonesI, 'id'> {}
export interface UserOuput extends Optional<ZonesI, 'id'> {}

class TypeProject
  extends Model<InferAttributes<TypeProject>, InferCreationAttributes<TypeProject>>
  implements ZonesI
{
  public id!: number;
  public name!: string;
  public company_id!: number;
  public icon!: string;
  public show!: boolean;
  public slug!: string;
  public created_at?: Date;
  public updated_at?: Date;
  public deleted_at?: Date;
}

TypeProject.init(
  {
    id: {
      type: new DataTypes.INTEGER({ length: 11, unsigned: true }),
      autoIncrement: true,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    company_id: {
      type: new DataTypes.INTEGER({ length: 11, unsigned: true }),
      defaultValue: 0,
    },
    icon: {
      type: DataTypes.STRING,
    },
    show: {
      type: DataTypes.BOOLEAN,
      defaultValue: true,
    },
    slug: {
      type: DataTypes.STRING,
    },
  },
  {
    sequelize: mariaDB,
    tableName: 'types_projects',
    underscored: true,
    paranoid: true,
  }
);

export default TypeProject;
