import {
  Sequelize,
  DataTypes,
  Model,
  InferAttributes,
  InferCreationAttributes,
  Optional,
  CreateOptions,
} from "sequelize";
import mariaDB from "./../../config/dbMariaDb";
import { DetailPlanPermissionI } from "../../interfaces/detailPlanPermission";
import Planes from "./plan";
import Permiso from "./permiso";


// export interface DetailPlanPermissionIpunt extends Optional
// <DetailPlanPermissionI,''> {}
// export interface DetailPlanPermissionOuput extends Optional<
// DetailPlanPermissionI,''> {}

class DetailPlanPermission
  extends Model<
    InferAttributes<DetailPlanPermission>,
    InferCreationAttributes<DetailPlanPermission>
  >
  implements DetailPlanPermissionI
{
  declare idplan : CreateOptions<number>;
  declare idpermiso : CreateOptions<number>;
  estado!: number;
  createdAt?: Date;
  updatedAt?: Date;
  deletedAt?: Date;
}

DetailPlanPermission.init(
  {
    idplan: { type: DataTypes.INTEGER, allowNull: false },
    idpermiso: { type: DataTypes.INTEGER, allowNull: false },
    estado: { type: DataTypes.INTEGER, allowNull: false },
    createdAt: { type: DataTypes.DATE, defaultValue: DataTypes.NOW },
    updatedAt: { type: DataTypes.DATE },
    deletedAt: { type: DataTypes.DATE },

    
  },
  
  
  {
    sequelize: mariaDB,
    tableName: "detailplanpermission",
    indexes: [{ unique: true, fields: ['idplan','idpermiso'] }]
  }
);

Planes.belongsToMany(Permiso, {
  through:{
    model: DetailPlanPermission,
    unique:true
  },
  foreignKey: "idplan",
  uniqueKey:"uc_plan_permiso"
});

Permiso.belongsToMany(Planes, {
  through: {
    model: DetailPlanPermission,
    unique: true
  },
  foreignKey: "idpermiso",
  uniqueKey:"uc_plan_permiso"
});




export default DetailPlanPermission;
