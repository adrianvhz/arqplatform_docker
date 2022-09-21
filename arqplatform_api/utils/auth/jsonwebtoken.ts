import jwt from 'jsonwebtoken';

export const generarJWT = (uid:string = '', secretkey : string) =>{
    //uid : identificador unico de usuario
    return new Promise( (resolve, reject) => {

        const payload = {uid}

        jwt.sign(payload, secretkey, {
            expiresIn : 60
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

