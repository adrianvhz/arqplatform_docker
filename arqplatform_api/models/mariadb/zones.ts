import { DataTypes, Model, InferAttributes, InferCreationAttributes, Optional } from 'sequelize';
import mariaDB from './../../config/dbMariaDb';
import { ZonesI } from '../../interfaces/zones';

export interface UserIpunt extends Optional<ZonesI, 'id'> {}
export interface UserOuput extends Optional<ZonesI, 'id'> {}

class Zones
  extends Model<InferAttributes<Zones>, InferCreationAttributes<Zones>>
  implements ZonesI
{
  public id!: number;
  public name!: string;
  public company_id!: number;
  public created_at?: Date;
  public updated_at?: Date;
  public deleted_at?: Date;
}

Zones.init(
	{
		id: {
			type: new DataTypes.INTEGER({ length: 11, unsigned: true }),
			autoIncrement: true,
			primaryKey: true
		},
		name: {
			type: DataTypes.STRING,
			allowNull: false
		},
		company_id: {
			type: new DataTypes.INTEGER({ length: 11, unsigned: true }),
			defaultValue: 0
		}
	},
	{
		sequelize: mariaDB,
		tableName: 'zones',
		underscored: true,
		paranoid: true
	}
);

export default Zones;
