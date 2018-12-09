public class Popup implements Showable {
  
  final int FADE_SPEED = 5;
  
  DrawOptions drawOpt;

  int liveTime, fade = 1;
  float x, y, w, h;
  float textSize = 16;
  String text;

  public String getTypeName() {
    return "Popup";
  }

  public Popup(float x, float y, float w, float h, int liveTime, String text) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.text = text;
    this.liveTime = liveTime*60;

    drawOpt = new DrawOptions(color(0), color(255), 1);
  }

  public void show() {
    liveTime--;
    float alpha = fade;

    if (liveTime < 0 & fade > -1) {
      fade-= FADE_SPEED;
    }
    else {
      fade+= FADE_SPEED;
    }

    stroke(red(drawOpt.stroke), green(drawOpt.stroke), blue(drawOpt.stroke), alpha);
    strokeWeight(drawOpt.strokeWeight);
    fill(red(drawOpt.fill), green(drawOpt.fill), blue(drawOpt.fill), alpha);
    
    line(x+10,y,x+w-10,y);
    line(x,y+10,x,y+h-10);
    line(x+10,y+h,x+w-10,y+h);
    line(x+w,y+10,x+w,y+h-10);
    
    arc(x+w-10,y+11,20,20,-HALF_PI,0);
    arc(x+w-10,y+h-10,20,20,0,HALF_PI);
    arc(x+11,y+h-10,20,20,HALF_PI,PI);
    arc(x+11,y+11,20,20,PI,PI+HALF_PI);
    
    strokeWeight(0);
    rect(x+1, y+11, w-2, h-21);
    rect(x+11, y+1, w-21, 10);
    rect(x+10, y+h-10, w-20, 10);

    fill(0, 0, 0, alpha);
    textSize(textSize);
    text(text, x, y, w, h);
  }
}
