int testRep = 100000;
int[][] set;

void setup()
{
 println(avg(rollSet(new int[] {10})));
 
}

int[][] rollSet(int[] dice)
{
  int repCount = 1;
  for(int i = 0; i < dice.length; i++)
  {
    repCount *= dice[i];
  }
  
  int[][] comboList = new int[repCount][dice.length];
  
  for(int i = 0; i < repCount; i++)
  {
    //Prevent overflow
    if (i == 0)
    {
      
      for(int ii = 0; ii < dice.length; ii++)
      {
        comboList[i][ii] = 1;
      }
      
    }
    else
    {
     comboList[i] = comboList[i-1].clone(); //<>//
     comboList[i][0] += 1;
    }
    

    for(int ii = 0; ii < dice.length; ii++)
    {
      if(comboList[i][ii] > dice[ii])
      {
        comboList[i][ii] = 1;
        comboList[i][ii+1] += 1;
      }
    }
  } //<>//
  return comboList;
}

float avg (int[][] table)
{  
  float avg = 0;
  for(int y = 0; y < table.length; y++)
  {
    float high = 0;
    for(int x = 0; x < table[y].length; x++)
    {
     if(table[y][x] > high)
     {
       high = table[y][x];
     }
    }
    avg+=high;
  }
  
  avg /= table.length;
  
  return avg;
}
