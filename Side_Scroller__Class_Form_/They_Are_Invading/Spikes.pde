//creates the spikes, dangerous!!
void spikes() {
  fill(162,15,20);
  for (int t1=60;t1<height-25;t1+=25) {
    stroke(0, 255, 0);
    line(0, t1-12.5, width, t1-12.5);
    stroke(0);
    triangle(0, t1-25, 0, t1, 50, t1-12.5);
    triangle(width, t1-25, width, t1, width-50, t1-12.5);
  }
  for (int t2=60;t2<width-25;t2+=25) {
    stroke(0, 255, 0);
    line(t2-12.5, 0, t2-12.5, height);
    stroke(0);
    triangle(t2-25, 0, t2, 0, t2-12.5, 50);
    triangle(t2-25, height, t2, height, t2-12.5, height-50);
  }
}

