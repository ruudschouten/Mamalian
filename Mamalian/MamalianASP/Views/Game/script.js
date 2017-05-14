function raceChanged() {
    var str = document.getElementById("charStrength");
    var dex = document.getElementById("charDexterity");
    var intl = document.getElementById("charIntelligence");

    var select = document.getElementById("charRace");
    race = select.options[select.selectedIndex].value;
    //Total shouldn't be higher than 21
    switch (race) { 
        case 1: //Cat
            str.value = "8";
            dex.value = "8";
            intl.value = "5";
            break;
        case 2: //Dog
            str.value = "8";
            dex.value = "5";
            intl.value = "8";
            break;
        case 3: //Fish
            str.value  = "3";
            dex.value  = "10";
            intl.value = "8";
            break;
        case 4: //Bird
            str.value = "4";
            dex.value = "7";
            intl.value = "10";
        case 5: //Horse
            str.value = "10";
            dex.value = "6";
            intl.value = "5";
    default:
    }
}