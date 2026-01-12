import tkinter as tk
from tkinter import ttk, filedialog
import json

# JSON-Daten laden (initialisieren Sie sie mit Standardwerten oder Platzhalterdaten)
data = {
    "ServerName": "Editable Server UI",
    "ButtonTxt1": "Welcome",
    "ButtonTxt2": "",
    "ButtonTxt3": "",
    "ButtonTxt4": "",
    "ButtonTxt5": "",
    "LinkButtonTxt1": "WBUI",
    "LinkButtonTxt2": "",
    "LinkButtonTxt3": "",
    "LinkButtonTxt4": "",
    "LinkButtonTxt5": "",
    "LinkButton1": "http://steamcommunity.com/sharedfiles/filedetails/?id=924619115",
    "LinkButton2": "",
    "Link1Button3": "",
    "Link2Button3": "",
    "Link3Button3": "",
    "Link4Button3": "",
    "Link1Button4": "",
    "Link2Button4": "",
    "Link3Button4": "",
    "Link4Button4": "",
    "Link1Button5": "",
    "Link2Button5": "",
    "Link3Button5": "",
    "Link4Button5": "",
    "Tab1Panelcount": 1,
    "Tab2Panelcount": 3,
    "Tab3Panelcount": 1,
    "Tab4Panelcount": 1,
    "Tab5Panelcount": 1,
    "BackgroundTab1": 0,
    "BackgroundTab2": 0,
    "BackgroundTab3": 0,
    "BackgroundTab4": 0,
    "BackgroundTab5": 0,
    "Background3Color": "0,0,255,0.5",
    "FontColorButtons": "255,255,255",
    "FontColorServerName": "255,95,0",
    "FontColorTabTitles": "20,255,0",
    "FontColorTabText": "255,255,255",
    "UseSteamBrowserLink1": False,  # Beachten Sie, dass es False statt false ist
    "UseSteamBrowserLink2": False,  # Beachten Sie, dass es False statt false ist
    "Tab1Title1": "Welcome",
    "Tab1Title2": "",
    "Tab1Title3": "",
    "Tab2Title1": "",
    "Tab2Title2": "",
    "Tab2Title3": "",
    "Tab3Title1": "",
    "Tab3Title2": "",
    "Tab3Title3": "",
    "Tab4Title1": "",
    "Tab4Title2": "",
    "Tab4Title3": "",
    "Tab5Title1": "",
    "Tab5Title2": "",
    "Tab5Title3": "",
    "Tab1Text1": "This UI is unedited. Pls contact an Admin.\n\n",
    "Tab1Text2": "",
    "Tab1Text3": "",
    "Tab2Text1": "",
    "Tab2Text2": "",
    "Tab2Text3": "",
    "Tab3Text1": "",
    "Tab3Text2": "",
    "Tab3Text3": "",
    "Tab4Text1": "",
    "Tab4Text2": "",
    "Tab4Text3": "",
    "Tab5Text1": "",
    "Tab5Text2": "",
    "Tab5Text3": ""
}

# Funktion zum Laden der JSON-Daten
def load_data(file_path):
    try:
        with open(file_path, 'r') as json_file:
            loaded_data = json.load(json_file)
        return loaded_data
    except FileNotFoundError:
        return None

# Funktion zum Speichern der JSON-Daten als Einzeiler
def save_as_single_line():
    # Öffnet den Datei-Explorer zum Speichern der Datei
    file_path = filedialog.asksaveasfilename(defaultextension=".json", filetypes=[("JSON files", "*.json")])

    if file_path:
        # Stelle sicher, dass die Dateiendung ".json" vorhanden ist
        if not file_path.endswith(".json"):
            file_path += ".json"

        # JSON-Daten als Einzeiler in die ausgewählte Datei schreiben
        with open(file_path, 'w') as json_file:
            json.dump(data, json_file, separators=(',', ':'))

# Funktion zum Laden der JSON-Daten als Einzeiler
def load_as_single_line(file_path):
    try:
        with open(file_path, 'r') as json_file:
            loaded_data = json.loads(json_file.read())
        return loaded_data
    except FileNotFoundError:
        return None

# Funktion zum Speichern der Änderungen in der JSON-Datei
def save_changes():
    for key in data.keys():
        # Überprüfe, ob der eingegebene Wert "True" oder "False" ist
        value = entry_fields[key].get().strip()
        if value.lower() == "true":
            data[key] = True
        elif value.lower() == "false":
            data[key] = False
        else:
            # Wenn der Wert weder "True" noch "False" ist, belasse ihn unverändert
            data[key] = value

    # Öffnet den Datei-Explorer zum Speichern der Datei
    file_path = filedialog.asksaveasfilename(defaultextension=".json", filetypes=[("JSON files", "*.json")])

    if file_path:
        # Stelle sicher, dass die Dateiendung ".json" vorhanden ist
        if not file_path.endswith(".json"):
            file_path += ".json"

        # JSON-Daten in die ausgewählte Datei schreiben
        with open(file_path, 'w') as json_file:
            json.dump(data, json_file, indent=4)

# Funktion zum Öffnen einer JSON-Datei
def open_file():
    file_path = filedialog.askopenfilename(filetypes=[("JSON files", "*.json")])
    if file_path:
        global data
        data = load_as_single_line(file_path)
        refresh_ui()

# Funktion zum Aktualisieren der Benutzeroberfläche mit den geladenen Daten
def refresh_ui():
    for key, value in data.items():
        if key in entry_fields:
            entry_fields[key].delete(0, tk.END)
            entry_fields[key].insert(0, value)

# Erstelle das Hauptfenster
root = tk.Tk()
root.title("Editable Server UI")

# Erstelle ein Scrollbar-Widget
scrollbar = ttk.Scrollbar(root)
scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

# Erstelle ein Frame, das die UI-Elemente enthält
frame = ttk.Frame(root)
frame.pack(fill=tk.BOTH, expand=True)

# Verknüpfe den Scrollbar mit dem Frame
frame.bind("<Configure>", lambda e: canvas.configure(scrollregion=canvas.bbox("all")))
canvas = tk.Canvas(frame, yscrollcommand=scrollbar.set)
canvas.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
scrollbar.config(command=canvas.yview)

# Erstelle ein inneres Frame für die UI-Elemente
inner_frame = ttk.Frame(canvas)
canvas.create_window((0, 0), window=inner_frame, anchor="nw")

# Erstelle Labels und Entry-Felder für die JSON-Daten
entry_fields = {}
for key, value in data.items():
    label = ttk.Label(inner_frame, text=key)
    label.grid(row=len(inner_frame.winfo_children()), column=0, padx=10, pady=5, sticky="w")

    entry = ttk.Entry(inner_frame)
    entry.insert(0, str(value))  # Konvertiere den Wert in einen String
    entry.grid(row=len(inner_frame.winfo_children()), column=1, padx=10, pady=5, sticky="w")
    entry_fields[key] = entry  # Speichere das Entry-Feld in einem Dictionary

# Erstelle einen Öffnen-Button
open_button = ttk.Button(root, text="Öffnen", command=open_file)
open_button.pack(pady=10)

# Erstelle einen Speichern-Button
save_button = ttk.Button(root, text="Speichern", command=save_changes)
save_button.pack(pady=10)

# Erstellen Sie einen Button zum Speichern als Einzeiler
save_single_line_button = ttk.Button(root, text="Speichern als Einzeiler", command=save_as_single_line)
save_single_line_button.pack(pady=10)

# Starte die GUI
root.mainloop()