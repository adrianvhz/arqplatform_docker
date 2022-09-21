import {
    Sequelize,
    DataTypes,
    Model,
    InferAttributes,
    InferCreationAttributes,
    Optional,
    CreationOptional,
  } from "sequelize";
  import mariaDB from "../../config/dbMariaDb";
  import { DetailUserPlanI } from "../../interfaces/detailUserPlan";
  import Planes from "./plan";
  import User from "./user";
 



// when creating an instance of the model (such as using Model.create()).
  class DetailUserPlan
    extends Model<
      InferAttributes<DetailUserPlan>,
      InferCreationAttributes<DetailUserPlan>
    >
    implements DetailUserPlanI
  {
    iduser!:number;
    idplan!:number;
    estado!: number;
    createdAt?: Date;
    updatedAt?: Date;
    deletedAt?: Date;
  }
  
  DetailUserPlan.init(
    {
      iduser: { type: DataTypes.INTEGER, allowNull: false },
      idplan: { type: DataTypes.INTEGER, allowNull: false },
      estado: { type: DataTypes.INTEGER, allowNull: false },
      createdAt: { type: DataTypes.DATE, defaultValue: DataTypes.NOW },
      updatedAt: { type: DataTypes.DATE },
      deletedAt: { type: DataTypes.DATE },
  
      
    },
    {
      sequelize: mariaDB,
      tableName: "detailuserplan",
      indexes: [{ unique: true, fields: ['iduser','idplan'] }]
    }
  );
  
  DetailUserPlan.removeAttribute('id');
  //return DetailUserPlan;
  
  // Planes.belongsToMany(User, {
  //   through:{
  //     model: DetailUserPlan,
  //     unique:true,
  //   },
  //   as:"User",
  //   foreignKey: "iduser",
  //   uniqueKey:"uc_user_plan"
  // });
  
  // Planes.belongsToMany(Planes, {
  //   through:{
  //     model: DetailUserPlan,
  //     unique:true
  //   },
  //   as:"Planes",
  //   foreignKey: "idplan",
  //   uniqueKey:"uc_user_plan"
  // });

  export default DetailUserPlan;
  