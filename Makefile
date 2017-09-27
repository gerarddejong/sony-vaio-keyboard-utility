PREFIX =
SYSCONFDIR = /etc

all:

install: install_scripts install_handlers
	@echo "Installation succeeded! Keys should now be enabled and working."

install_scripts:
	@echo "Copying control scripts..."
	@install -d $(SYSCONFDIR)/acpi
	@install sony-keyboard-backlight.sh $(SYSCONFDIR)/acpi
	@install sony-keyboard-wifi.sh $(SYSCONFDIR)/acpi

install_handlers:
	@echo "Copying event handlers..."
	@install -d $(SYSCONFDIR)/acpi/events
	@install events/sony-keyboard-backlight-down $(SYSCONFDIR)/acpi/events 
	@install events/sony-keyboard-backlight-up $(SYSCONFDIR)/acpi/events 
	@install events/sony-keyboard-s1 $(SYSCONFDIR)/acpi/events 
	@install events/sony-keyboard-s2 $(SYSCONFDIR)/acpi/events

acpid_restart:
	@echo "Restarting ACPI deamon..."
	@service acpid restart
