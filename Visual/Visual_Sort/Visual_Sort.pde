import javax.swing.JOptionPane;

final static int COUNT = 100;
ArrayList<Integer> sortArray;
ArrayList<Integer> elementList;

int pointer = 0;
int cycleCount = 0;
int compareCount = 0;
int swapCount = 0;
boolean isDone = false;
boolean isAuto = false;

void setup() {
 noStroke();
 size(500,300);
 frameRate(60);
 generateNewSortArray();
}

void generateNewSortArray() {
  sortArray = new ArrayList<Integer>(COUNT);
  elementList = new ArrayList<Integer>(COUNT);
  for (int i = 1; i <= COUNT; i++) {
      int minHeight = height/COUNT;
      elementList.add(minHeight*i);
    }
    for (int i = 0; i < COUNT; i++) {
      int index = (int) random(elementList.size());
      sortArray.add(elementList.get(index));
      elementList.remove(index);
    }
}

void draw() {
  background(255);
  float elementWidth = width/COUNT;
  for (int i = 0; i < COUNT; i++) {
    int element = sortArray.get(i);
    float elementStart = elementWidth*i;
    
    float t = element/(height/COUNT);
    float r = (256f - 256f/(COUNT/2)*t);
    float g = 256f-r;
    float b = 0;
    if (element >= height/2) {
      r = 0;
      g = (256f - 256f/(COUNT/2)*(t - COUNT/2));
      b = 256f-g;
    }
    
    fill(r,g,b);
    rect(elementStart,height-element,elementWidth,element);
    if (isAuto) {
      sort();
    }
  }
}

void mouseClicked() {
  if (isDone) {
    pointer = 0;
    cycleCount = 0;
    compareCount = 0;
    swapCount = 0;
    isDone = false;
    isAuto = false;
    
    generateNewSortArray();
  }
  else {
    isAuto = true;
  }
}

void mouseWheel() {
  sort();
}

void sort() {
  if (!isDone) {
    cycleCount++;
    selection();
    isDone = check();
  }
}

void selection() {
  int minVal = height;
  int minIndex = 0;
  for (int i = pointer; i < COUNT; i++) {
    int element = sortArray.get(i);
    compareCount++;
    if (element < minVal) {
      minVal = element;
      minIndex = i;
    }
  }
  swap(pointer,minIndex);
  pointer++;
}

void bubble() {
  for (int i = 1; i < COUNT; i++) {
    int lastElement = sortArray.get(i-1);
    int currentElement = sortArray.get(i);
    compareCount++;
    if (lastElement > currentElement) {
      swap(i,i-1);
    }
  }
}

boolean check() {
  for (int i = 1; i < COUNT; i++) {
    int lastElement = sortArray.get(i-1);
    int currentElement = sortArray.get(i);
    if (lastElement > currentElement) {
      return false;
    }
  }
  showMsg("Кол-во циклов: "+cycleCount+"\nКол-во сравнений: "+compareCount+"\nКол-во перестановок: "+swapCount);
  return true;
}

void showMsg(Object mgs) {
  JOptionPane.showMessageDialog(null,mgs,"Сортировка окончена!",JOptionPane.PLAIN_MESSAGE);
}

void swap(int index1, int index2) {
  int holder = sortArray.get(index2);
  sortArray.set(index2, sortArray.get(index1));
  sortArray.set(index1, holder);
  swapCount++;
}
