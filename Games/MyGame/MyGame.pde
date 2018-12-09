import processing.net.*;

ArrayList<Showable> elements = new ArrayList<Showable>();
ArrayList<Showable> addElements = new ArrayList<Showable>();
boolean isDisabled = false;
String state;

void setup() {
  size(800,800,P2D);
  //fullScreen();
  frameRate(60);
  
  elements = new ArrayList<Showable>();
  loadMain();
  
  textAlign(CENTER, CENTER);
}

void mousePressed() {
  if (isDisabled) {
    return;
  }
  for (Showable show : elements) { 
    if (!show.getTypeName().equals("Button")) {
      continue;
    }
    Button btn = (Button) show;
    if (btn.mouseHover()) {
      btn.action.perform(btn);
    }
  }
}

void draw() {
  background(255);
  
  if (addElements.size() > 0) {
    elements.addAll(addElements);
    addElements = new ArrayList<Showable>();
  }
  
  for (Showable show : elements) {
    show.show();
  }
  
}

void loadMain() {
  state = "MainMenu";
  
  elements = new ArrayList<Showable>();
  
  for (int i = 0; i < 5; i++) {
    Button btn = new Button(width/2-200,height/2-200+80*i,400,75);
    elements.add(btn);
    switch (i) {
      case 0:
        btn.text = "Новая игра";
        btn.textSize = 30;
        btn.setAction(new Action() {
          public void perform(Button btn) {
            loadGrid();
          }
        });
        break;
      case 1:
        btn.text = "Игра по сети";
        btn.textSize = 30;
        btn.setAction(new Action() {
          public void perform(Button btn) {
            addElements.add(new Popup(150,150,200,200,2,"Игра по сети не доступна."));
          }
        });
        break;
      case 2:
        btn.text = "Параметры";
        btn.textSize = 30;
        break;
      case 3:
        btn.text = "Редактор";
        btn.textSize = 30;
        break;
      case 4:
        btn.text = "Выход";
        btn.textSize = 30;
        btn.setAction(new Action() {
          public void perform(Button btn) {
            exit();
          }
        });
        break;
    }
  }
}

void loadNewGameSetup() {
  state = "NewGameSetup";
  
  elements = new ArrayList<Showable>();
  
  //elements.add(new Button());
}

void loadGrid() {
  elements = new ArrayList<Showable>();
  state = "Game";
  
  float size = (width-100)/5;
  
  for (int y = 0; y < 5; y++) {
    for (int i = 0; i < 5; i++) {
      Button btn = new Button(50+size*i,100+50*y,size,50);
      btn.text = ""+(100*i+100);
      btn.setAction(new Action() {
        public void perform(Button btn) {
          isDisabled = true;
          btn.disable(!btn.isDisabled);
        }
      });
      elements.add(btn);
    }
  }
}
