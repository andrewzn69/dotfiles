from event import Event
import gi
gi.require_version("Gtk", "3.0")
from gi.repository import Gtk, Gdk
from utils import get_glade_file_path

import json



class EventElement(Gtk.Box):
    '''
    Event element UI, made with Glade
    '''

    def __init__(self, event, ondelete):
        Gtk.Box.__init__(
            self, orientation=Gtk.Orientation.VERTICAL, spacing=0)
        self.eventjson = event
        self.event = Event.fromJson(event)
        self.set_homogeneous(False)
        self.on_delete = ondelete
        builder = Gtk.Builder()
        builder.add_from_file(get_glade_file_path('eventelement.glade'))
        handlers = {
            "on_delete_clicked": self.on_delete_clicked
        }
        builder.connect_signals(handlers)
        eventelement = builder.get_object('eventelement')
        self.pack_start(eventelement, True, True, 0)
        # Time
        time = builder.get_object('time')
        time.set_markup("<b> %s:%s</b>" %
                        (self.event.time[0], self.event.time[1]))
        # Title
        subject = builder.get_object('subject')
        subject.set_label(self.event.subject)

        # Content
        content = builder.get_object('event')
        textbuffer = content.get_buffer()
        textbuffer.set_text(self.event.event)

    def on_delete_clicked(self, button):
        if self.on_delete:
            self.on_delete(self, self.eventjson)
