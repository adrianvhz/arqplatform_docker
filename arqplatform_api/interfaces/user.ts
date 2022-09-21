export interface UserI  {
     id : number ;
     name : string ;
     lastname: string;
     email : string;
     password? : string ;
     image? : string ;
     sex : number;
     profile_id : number; 
     createdAt? : Date ; 
     updatedAt? : Date;
     deleted_at? :Date ;
}
