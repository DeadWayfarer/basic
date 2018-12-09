public class Button implements Showable {
  
  public final static String TYPE = "Button";
  DrawOptions drawOpt;
  DrawOptions disOpt;
  DrawOptions selOpt;
  float textSize = 15;
  
  float x,y,w,h;
  String text;
  
  boolean isDisabled = false;
  
  Action action = new Action() {
    public void perform() {}
  };
  
  public String getTypeName() {
    return "Button";
  }
  
  public Button(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    
    text = "";
    drawOpt = new DrawOptions(color(0),color(255),1);
    selOpt = new DrawOptions(color(0),color(200),1);
    disOpt = new DrawOptions(color(0),color(100),1);
  }
  
  public void show() {
    DrawOptions options;
    if (isDisabled) {
      options = disOpt;
    } else if (mouseHover()) {
      options = selOpt;
    }
    else {
      options = drawOpt;
    }
    
    stroke(options.stroke);
    strokeWeight(options.strokeWeight);
    fill(options.fill);
    
    rect(x,y,w,h);
    
    fill(0);
    textSize(textSize);
    text(text,x+w/2,y+h/2);
  }
  
  public void setAction(Action action) {
    this.action = action;
  }
  
  public boolean mouseHover() {
    return mouseX > x & mouseX < x + w & mouseY > y & mouseY < y + h;
  }
  
  public void disable(boolean bool) {
    isDisabled = bool;
  }
}

abstract class Action {
  public void perform(Button btn) {
    
  }
}
