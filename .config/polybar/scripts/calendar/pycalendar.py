#!/usr/bin/env python3
from utils import get_glade_file_path, get_wal_colors
from eventelement import EventElement
from event import LocalEvents, Event
import json
import datetime
import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, Gdk



class PolybarCalendar(Gtk.Builder):
    def __init__(self):
        Gtk.Builder.__init__(self)
        self.add_from_file(get_glade_file_path('calendar.glade'))
        self.add_from_file(get_glade_file_path('eventpopup.glade'))
        # event handler for ui
        handlers = {
            "on_calendar_day_selected": self.on_calendar_day_selected,
            "on_addevent_pressed": self.on_addevent_pressed,
            "on_eventpopup_response": self.on_new_event_response
        }
        self.connect_signals(handlers)
        # properties
        self.window = self.get_object('calendarwindow')
        self.calendar = self.get_object('calendar')
        self.eventsbox = self.get_object('eventsbox')
        self.add_eventwindow = self.get_object('eventpopup')
        self.addevent_subject = self.get_object('subject')
        self.addevent_hour = self.get_object('hour')
        self.addevent_min = self.get_object('min')
        self.addevent_event = self.get_object('event')
        # Events setup
        self.eventlist = []
        self.events = LocalEvents()
        # set date for the calendar
        date = datetime.date.today()
        self.calendar.select_day(date.day)
        self.calendar.select_month(date.month-1, date.year)

    def on_calendar_day_selected(self, calendar: Gtk.Calendar):
        self.show_events(calendar)

    def on_addevent_pressed(self, button):
        self.addevent_hour.set_text(str(datetime.datetime.now().hour))
        self.addevent_min.set_text(
            "{:02d}".format(datetime.datetime.now().minute))
        self.add_eventwindow.show_all()

    def on_new_event_response(self, button, response):
        if response == -6:
            self.add_eventwindow.hide()
        else:
            event_textbuffer = self.addevent_event.get_buffer()
            start, end = event_textbuffer.get_bounds()
            event = Event(((self.addevent_hour.get_text()),
                           (self.addevent_min.get_text())), self.addevent_subject.get_text(),
                          event_textbuffer.get_text(start, end, True))
            self.add_eventwindow.hide()
            self.events.add_event(self.calendar.get_date(), event)
            self.show_events(self.calendar)

    def show_events(self, calendar):
        day = calendar.get_date()
        day_events = self.events.get_events(day)
        for ex in self.eventlist:
            if ex != None:
                self.eventsbox.remove(ex)
        self.eventlist = []
        if day_events == None or len(day_events) == 0:
            label_addevent = Gtk.Label(label="No Events")
            self.eventsbox.add(label_addevent)
            self.eventlist.append(label_addevent)
        else:
            for event in day_events:
                eventexpander = EventElement(event, self.on_delete_event)
                self.eventsbox.add(eventexpander)
                self.eventlist.append(eventexpander)
        self.window.show_all()

    def on_delete_event(self, event_element, event):
        self.events.remove_event(self.calendar.get_date(), event)
        self.eventsbox.remove(event_element)
        self.eventlist.remove(event_element)
        self.show_events(self.calendar)


def gtk_style():
    colors = get_wal_colors()
    css = b"""
* {
    transition-property: color, background-color, border-color, background-image, padding, border-width;
    transition-duration: 0.15s;
    font-size: 16px;
    color: %s
}
button {
   background: %s;
}
.time {
    color: %s;
}
.addeventbox {
    background-color: %s;
}
.frame {
    background-color: %s;
}
.calendar {
    background-color: %s;
}
.calendar:selected{
    color:%s;
    background-color:%s;
}
.textview{
    background-color:%s;
}

""" % (
        str.encode(colors['color7']),
        str.encode(colors['color1']),
        str.encode(colors['color3']),
        str.encode(colors['color0']),
        str.encode(colors['color0']),
        str.encode(colors['color0']),
        str.encode(colors['color0']),
        str.encode(colors['color1']),
        str.encode(colors['color1'])
    )

    style_provider = Gtk.CssProvider()
    style_provider.load_from_data(css)

    Gtk.StyleContext.add_provider_for_screen(
        Gdk.Screen.get_default(),
        style_provider,
        Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
    )


win = PolybarCalendar().window
win.connect("destroy", Gtk.main_quit)
win.show_all()
gtk_style()
Gtk.main()
