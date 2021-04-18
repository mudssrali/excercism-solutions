export const rows = (n) => {
  let prevLine = [1], lines = [];

  for(let row=0; row<n; row++){
    let line=[ prevLine[0] ]
    for(let i=0; i< prevLine.length; i++){
       line.push( i+1<prevLine.length?prevLine[i] + prevLine[i+1]:1 )
    }
    lines.push( prevLine )
    prevLine=line
  }
  return lines
};
