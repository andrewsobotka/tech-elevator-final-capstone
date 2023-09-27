import axios from "axios";

export default{
    getRecipes(){
        return axios.get("/recipes")
    }
}