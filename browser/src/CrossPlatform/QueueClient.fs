module App.QueueClient


open Fable.SimpleHttp

let requestData = "{ \"id\": \"PLAYER_NAME\" }"
let serverAddress = "http://localhost:8090"
let weaponFireQueueEndpoint: string = "/api/fire"
let knifeStabQueueEndpoint: string = "/api/stab"
let enemyDeathQueueEndpoint: string = "/api/kill"
let playerDeathQueueEndpoint: string = "/api/death"

let sendWeaponFireEvent () = async {
    printfn "%s" "Bang!"
}


let sendKnifeStabEvent () = async {
    printfn "%s" "Stab!"
}

let sendKillEvent () = async {
    printfn "%s" "Die!"
}

let sendDeathEvent () = async {
    printfn "%s" "Ooof"
}


