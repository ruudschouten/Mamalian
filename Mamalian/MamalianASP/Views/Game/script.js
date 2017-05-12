var left = 0;
var str = 0, dex = 0, intl = 0;
var ran = 0;

$.getScript("/Scripts/Pages/ReferralEdit.js")
    .done(function (script, textStatus) {
        initReferralEdit();
    })
    .fail(function (jqxhr, settings, exception) {
        console.log('failed to load script');
    });

function initialize() {
    left = 8;
    str = 5;
    dex = 5;
    intl = 5;
    ran = 1;
}

function addValue(kind) {
    if (ran == 0) { initialize(); }
    if (left != 0) {
        left--;
        if (kind == "str") {
            str++;
        } else if (kind == "dex") {
            dex++;
        } else if (kind == "intl") {
            intl++;
        }
    }
}

function reduceValue(kind) {
    if (ran == 0) { initialize(); }
    if (kind == "str") {
        if (str != 0) {
            str--;
            leftPoints++;
        }
    } else if (kind == "dex") {
        if (dex != 0) {
            dex--;
            leftPoints++;
        }
    } else if (kind == "intl") {
        if (ntl != 0) {
            intl--;
            leftPoints++;
        }
    }
}