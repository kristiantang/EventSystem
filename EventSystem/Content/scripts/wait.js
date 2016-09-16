
function GetEvents() {
    $.ajax({
        url: "api/Events"
    })
    .done(function (data) {
        $.each(data, function (key, item) {
            console.log(item);

            $('<div>', { class: "col-md-3", html: RenderEvents(item) })
            .appendTo($('.musik'));
        })
    })
}
GetEvents();


function RenderEvents(item) {
    return "<div class='eventCard'>\
                <a href='#' class='eventCardLink'>\
                    <div class='eventCardHeader'>\
                        <div class='eventCardImg'>\
                            <img src='" + item.Media[0].Url + "' />\
                                    <div class='eventCardDate'>\
                                        <div class='eventCardDay'>" + item.EventStart + "</div>\
                                        <div class='eventCardMonth'>Sep</div>\
                                    </div>\
                                </div>\
                            </div>\
                            <div class='eventCardContent'>\
                                <h3 class='eventCardTitle'>" + item.Name + "</h3>\
                                <div class='eventLocation'>\
                                    <p>" + item.Location.City + "</p>\
                                </div>\
                            </div>\
                        </a>\
                        <div class='eventCategory'>\
                            <a href='Musik'>" + item.Categories.Name + "</a>\
                        </div>\
                    </div>";
}