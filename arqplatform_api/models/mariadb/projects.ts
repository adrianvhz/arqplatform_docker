import { DataTypes, Model, InferAttributes, InferCreationAttributes, Optional } from 'sequelize';
import mariaDB from './../../config/dbMariaDb';
import { UserI } from '../../interfaces/user';
import { ProjectsI } from '../../interfaces/projects';

export interface UserIpunt extends Optional<ProjectsI, 'id'> {}
export interface UserOuput extends Optional<ProjectsI, 'id'> {}

class Project
  extends Model<InferAttributes<Project>, InferCreationAttributes<Project>>
  implements ProjectsI
{
  public id!: number;
  public name!: string;
  public code!: string;
  public capacity!: number;
  public client!: string;
  public ubication!: string;
  public manager!: string;
  public parent_id!: number;
  public student!: string;
  public zone!: string;
  public level!: string;
  public sublevel!: string;
  public public!: string;
  public room!: number;
  public height!: number;
  public width!: number;
  public user_id!: number;
  public type_id!: number;
  public company_id!: number;
  public coordenadas!: string;
  public tipologia!: string;
  public distrito!: string;
  public puntos!: JSON;
  public ambientes!: JSON;
  public aforo!: JSON;
}

Project.init(
  {
    id: {
      type: new DataTypes.INTEGER({ unsigned: true, length: 11 }),
      primaryKey: true,
      autoIncrement: true,
      allowNull: false,
    },
    name: {
      type: DataTypes.STRING,
    },
    code: {
      type: DataTypes.STRING,
    },
    capacity: {
      type: new DataTypes.INTEGER({ length: 11 }),
    },
    client: {
      type: DataTypes.STRING,
    },
    ubication: {
      type: DataTypes.STRING,
    },
    manager: {
      type: DataTypes.STRING,
    },
    parent_id: {
      type: new DataTypes.INTEGER({ length: 11 }),
    },
    student: {
      type: new DataTypes.INTEGER({ length: 11 }),
    },
    zone: {
      type: DataTypes.STRING,
    },
    level: {
      type: DataTypes.STRING,
    },
    sublevel: {
      type: DataTypes.STRING,
    },
    public: {
      type: new DataTypes.INTEGER({ length: 11 }),
    },
    room: {
      type: new DataTypes.INTEGER({ length: 11 }),
    },
    height: {
      type: new DataTypes.INTEGER({ length: 11 }),
    },
    width: {
      type: new DataTypes.INTEGER({ length: 11 }),
    },
    user_id: {
      type: new DataTypes.INTEGER({ length: 11 }),
    },
    type_id: {
      type: new DataTypes.INTEGER({ length: 11 }),
    },
    company_id: {
      type: new DataTypes.INTEGER({ length: 11 }),
    },
    coordenadas: {
      type: DataTypes.STRING,
    },
    tipologia: {
      type: DataTypes.STRING,
    },
    distrito: {
      type: DataTypes.STRING,
    },
    puntos: {
      type: DataTypes.JSON,
    },
    ambientes: {
      type: DataTypes.JSON,
    },
    aforo: {
      type: DataTypes.JSON,
    },
  },
  {
    sequelize: mariaDB,
    tableName: 'projects',
    paranoid: true,
    underscored: true,
  }
);

export default Project;
