function all(){
    var names = document.getElementsByClassName("replaceme");
    for (var i = 0; i < names.length; i++) {
        const element = names[i].innerHTML;
        const pieces = element.split('_').join('   ');
        names[i].innerHTML = pieces;
    }
    var dates = document.getElementsByClassName("reverseDate");
    for (var i = 0; i < dates.length; i++) {
        const element = dates[i].innerHTML;
        const pieces = element.split('-').reverse().join('.');
        dates[i].innerHTML = pieces;
    }
    var comps = document.getElementsByClassName("compulsory");
    for (var i = 0; i < comps.length; i++) {
        const element = comps[i].innerHTML;
        if (element === "false"){
            comps[i].innerHTML = "No";
        }
        else if (element === "true"){
            comps[i].innerHTML = "Yes";
        }
    }
}
