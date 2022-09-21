import * as bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';

export default class Auth {

    public static hashPasswordSync(password: string, rounds: number) : string {
      return  bcrypt.hashSync(password, rounds);
    }

    public static compareSync(password: string, dbHash: string) {
       return bcrypt.compareSync(password, dbHash);
    }

    public static hashPassword(password: string, rounds: number, callback: (error: Error, hash: string) => void) : void {
        bcrypt.hash(password, rounds, (error, hash) => {
            callback(error, hash);
        });
    }

    public static compare(password: string, dbHash: string, callback: (error: string | null, match: boolean | null) => void) {
        bcrypt.compare(password, dbHash, (err: Error, match: boolean) => {
            if(match) {
                // passwords match
                callback(null, true);
            } else {
                // passwords do not match
                callback('Invalid password match', null);
            }
        });
    }

    public static generarToken(id:number, secretkey : string) {

        return new Promise( (resolve, reject) => {

            const payload = {id}
    
            jwt.sign(payload, secretkey, {
                expiresIn : '2h'
            },(err,token)=>{
                if(err){
                    console.log(err)
                    reject('No se puede generar el JWT')
                }else{
                    resolve(token)
                }
            })
    
        })


    }
}