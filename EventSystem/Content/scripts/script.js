$(document).ready(function () {

    function GetCategory() {
        $.ajax({
            url:"api/Category"
        })
        .done(function (data) {
            $.each(data, function (key, item) {
                $('<div>', { class:"row categoryHide",html: RenderCategory(item) })
                .appendTo($('#categoryContainer'));
            })
            $('.categoryHideCheck').each(function () {
                if ($.trim($(this).html()) == '')
                    $(this).parents('.categoryHide').hide();
            });
        })
    }
    GetCategory();

    function GetDetailPage() {

            $.ajax({
                url: "api/Events/" + getUrlVars().id
            }).done(function (detail) {
                $('<div>', { class: "", html: RenderDetails(detail) })
                .appendTo($('#detailPage'));
            })
    }
    GetDetailPage();

    function GetPaymentPage() {

        $.ajax({
            url: "api/Events/" + getUrlVars().id
        }).done(function (payment) {
            $('<div>', { class: "paymentCover", html: RenderPayment(payment) })
            .appendTo($('#paymentPage'));
        })
    }
    GetPaymentPage();

    //NiceDate(sDate);
    //NiceTime(sDate);

});

function RenderCategory(item) {
    var categoryHeader = "<div class='col-md-6'>\
                            <h3 class='categoryName'>" + item.Name + "</h3>\
                        </div>\
                        <div class='col-md-6'>\
                            <a href='#' class='showAll pull-right'>Se alle</a>\
                        </div>\
                        <div class='categoryHideCheck'>";

    $.each(item.Events, function (key, event) {
        categoryHeader += "<div class='col-md-3'>\
                            <div class='eventCard'>\
                                <a data-id='" + event.Id + "' href='detail.html?id=" + event.Id + "' class='eventCardLink showEvent'>\
                                    <div class='eventCardHeader'>\
                                        <div class='eventCardImg'>\
                                            <img src='" + event.Media[0].Url + "' />\
                                            <div class='eventCardDate'>\
                                                <div class='eventCardDay'>" + event.EventStart + "</div>\
                                                <div class='eventCardMonth'>Sep</div>\
                                            </div>\
                                        </div>\
                                    </div>\
                                    <div class='eventCardContent'>\
                                        <h3 class='eventCardTitle'>" + event.Name + "</h3>\
                                        <div class='eventLocation'>\
                                            <p>" + event.Location.City + "</p>\
                                       </div>\
                                    </div>\
                                </a>\
                                <div class='eventCategory'>\
                                    <a href='Musik'>" + item.Name + "</a>\
                                </div>\
                                </div>\
                            </div>";
    });

    categoryHeader += "</div>"

    return categoryHeader;
}
function RenderDetails(detail) {
    return "<div class='detailCover'>\
                <div class='container'>\
                    <h1 class='detailCoverText'>" + detail.Name + "</h1>\
                </div>\
                <img class='detailCoverImg' src='" + detail.Media[0].Url + "'/>\
            </div>\
<div class='detailHeader'>\
            <div class='container '>\
                <div class='row'>\
                    <div class='col-md-7'>\
                        <h4 class='detailEventInfo'><i class='fa fa-calendar-o' aria-hidden='true'></i> " + detail.EventStart + " - " + detail.EventEnd + "</h5>\
                        <h4 class='detailEventInfo'><i class='fa fa-map-marker' aria-hidden='true'></i> " + detail.Location.Adress + ", " + detail.Location.Zipcode + ", " + detail.Location.City + "</h5>\
                        <div class='row locationLine'>\
                            <div class='col-md-9'>\
                                <h4>"+detail.Location.Adress+"</h4>\
                                <a href='#'>Kontakt arrangør</a>\
                            </div>\
                            <div class='col-md-3'>\
                                <img class='detailLogo' src='"+detail.Media[0].Url+"'/>\
                            </div>\
                        </div>\
                    </div>\
                    <div class='col-md-5'>\
                        <a data-id='" + detail.Id + "' href='payment.html?id=" + detail.Id + "'><button type='button' class='btn btn-primary findTicket'>Find billetter</button></a>\
                        <ul class='detailSocialShare'>\
                            <li class='detailSocialIcons'><i class='fa fa-comments-o' aria-hidden='true'></i></li>\
                            <li class='detailSocialIcons'><i class='fa fa-envelope' aria-hidden='true'></i></li>\
                            <li class='detailSocialIcons'><i class='fa fa-facebook' aria-hidden='true'></i></li>\
                            <li class='detailSocialIcons'><i class='fa fa-twitter' aria-hidden='true'></i></li>\
                        </ul>\
                    </div>\
                </div>\
</div>\
</div>\
<div class='container detailDescription'>\
                <div class='row'>\
                    <div class='col-md-7'>\
                        <h4>Detaljer</h4>\
                        <p>" + detail.Description + "</p>\
                    </div>\
                    <div class='col-md-5 '>\
<div class='detailTicketInfo'>\
                        <h4>Billet</h4>\
                        <p class='detailTicketPrice'>DKK "+detail.Price+" + DKK 8,00 gebyr</p>\
                        <p class='detailPayment'>Din kortudbyder vil opkræve et ekstra gebyr udfra din korttype</p>\
                    </div>\
                    </div>\
                </div>\
            </div>";
}
function RenderPayment(payment) {
    return "<div class='container'>\
                <h4><span class='paymentCoverName'>" + payment.Name + "</span> " + payment.EventStart + "</h4>\
                <h1>Vælg billetter</h1>\
            </div>";
}

function NiceTime(sDateTime) {
    arrDateTime = sDateTime.split('T');
    sTime = arrDateTime[1];
    arrTime = sTime.split(':');
    sTime = arrTime[0] + ':' + arrTime[1];
    return sTime;
}
function NiceDate(sDateTime) {
    arrDateTime = sDateTime.split('T');
    sDate = arrDateTime[0];
    arrDate = sDate.split('-');

    iYear = arrDate[0];
    iMonth = arrDate[1];
    iDay = arrDate[2];

    sReturn = iDay + '. ';

    if (iMonth == 1) {
        sReturn = sReturn + 'Januar';
    } else if (iMonth == 2) {
        sReturn = sReturn + 'Februar';
    } else if (iMonth == 3) {
        sReturn = sReturn + 'Marts';
    } else if (iMonth == 4) {
        sReturn = sReturn + 'April';
    } else if (iMonth == 5) {
        sReturn = sReturn + 'Maj';
    } else if (iMonth == 6) {
        sReturn = sReturn + 'Juni';
    } else if (iMonth == 7) {
        sReturn = sReturn + 'Juli';
    } else if (iMonth == 8) {
        sReturn = sReturn + 'August';
    } else if (iMonth == 9) {
        sReturn = sReturn + 'September';
    } else if (iMonth == 10) {
        sReturn = sReturn + 'Oktober';
    } else if (iMonth == 11) {
        sReturn = sReturn + 'November';
    } else if (iMonth == 12) {
        sReturn = sReturn + 'December';
    } else {
        return false;
    }

    sReturn = sReturn + ' ' + iYear;
    return sReturn;
}

function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}
