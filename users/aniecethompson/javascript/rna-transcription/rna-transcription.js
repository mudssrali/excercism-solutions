export const toRna = (s) => {
  if(!s){
    return s
  }
  let answer = s.split('')

  for(let i =0; i <= answer.length; i++){
    
    switch(answer[i]){
      case "C": answer[i] = "G"; break;
      case "G": answer[i] = "C"; break;
      case "T": answer[i] = "A"; break;
      case "A": answer[i] = "U"; break;
    }
  }
  
  return answer.join('')
};
