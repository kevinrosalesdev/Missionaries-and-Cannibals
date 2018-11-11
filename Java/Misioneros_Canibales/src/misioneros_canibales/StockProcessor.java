/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package misioneros_canibales;

import Reader.FileTextReader;
import combinationsGenerator.IteradorCombinacion;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Hector
 */
public class StockProcessor {
    
    
    
    private static int numero_misioneros(List <String> lista){
        int result=0;
        result = lista.stream().filter((aux) -> ("1".equals(aux))).map((_item) -> 1).reduce(result, Integer::sum);
        return result;
    }
    
    private static int numero_canibales(List <String> lista){
        int result=0;
        result = lista.stream().filter((aux) -> ("2".equals(aux))).map((_item) -> 1).reduce(result, Integer::sum);
        return result;
    }
    private List<String> clone(List<String> lista){
        List<String>result= new LinkedList();
        Iterator i= lista.iterator();
        while(i.hasNext()){
            result.add((String) i.next());
        }
        return result;
    }
    
    public void misioneros_Canibales(String fichero){
        List<String> a = FileTextReader.read(fichero);
        Iterator b= a.iterator();
        int iteraciones=0;
        List <Long> tiempos= new LinkedList();
        while(b.hasNext()){
            System.out.println("############################==" + 
                    iteraciones + "==#############################");
            System.out.println("Iteración: "+ iteraciones);
            iteraciones++;
            String aux= (String) b.next();
            List<String> orillaA= FileTextReader.toInt(aux);
            List<String> orillaB= new LinkedList();
            
            if (numero_canibales(orillaA) > numero_misioneros(orillaA)){
                System.out.println("El número de canibales no puede superar al de misioneros");
                continue;
            }
            
            if (numero_misioneros(orillaA)==10 && numero_canibales(orillaA)==8 ){
                System.out.println("Esa combinación no se puede dar");
                continue;
            }
            
            if (orillaA.size()%3!=0){
                System.out.println("NO ES MULTIPLO DE 3");
                continue;
            }
            System.out.println("El número de misoneros: " + numero_misioneros(orillaA));
            System.out.println("El número de canibles: " + numero_canibales(orillaA));
            Iterator p= orillaA.iterator();
            
            while(p.hasNext()){
                System.out.println("ORILLA_A -->"+orillaA.size());
                System.out.println("ORILLA_B -->"+orillaB.size());
                
                IteradorCombinacion it = new IteradorCombinacion(orillaA, 3);
                Iterator s = it.iterator();
                while (s.hasNext()) {
                    List t= (List) s.next();
                    List<String> auxA= clone(orillaA);
                    List<String> auxB= clone(orillaB);
                    Iterator ti= t.iterator();
                    while(ti.hasNext()){
                        String auxTi= (String) ti.next();
                        auxA.remove(auxTi);
                        auxB.add(auxTi);
                    }
                    if ((numero_misioneros(t)>numero_canibales(t) || numero_misioneros(t)==0)
                            && numero_misioneros(auxA)!=1
                            && (numero_canibales(auxA)<= numero_misioneros(auxA) || numero_misioneros(auxA)==0)
                            && (numero_canibales(auxB) <= numero_misioneros(auxB))){
                        System.out.println("Combinacion ganadoras:"+ t);
                        Iterator ti2= t.iterator();
                        while(ti2.hasNext()){
                            String auxTi2=  (String) ti2.next();
                            orillaA.remove(auxTi2);
                            orillaB.add(auxTi2);
                        }
                        break;
                        
                    }
                
                }
                
            }
            System.out.println("Resultado de la orilla A: "+ orillaA);
            System.out.println("Resultado de la orilla B: "+ orillaB);
        }
       
        
    }
        public void misioneros_CanibalesT(String fichero){
        List<String> a = FileTextReader.read(fichero);
        Iterator b= a.iterator();
        int iteraciones=0;
        List <Long> tiempos= new LinkedList();
        while(b.hasNext()){
            long tiempoInicio= System.nanoTime();
            System.out.println("############################==" + 
                    iteraciones + "==#############################");
            System.out.println("Iteración: "+ iteraciones);
            iteraciones++;
            String aux= (String) b.next();
            List<String> orillaA= FileTextReader.toInt(aux);
            List<String> orillaB= new LinkedList();
            
            if (numero_canibales(orillaA) > numero_misioneros(orillaA)){
                System.out.println("El número de canibales no puede superar al de misioneros");
                continue;
            }
            
            if (numero_misioneros(orillaA)==10 && numero_canibales(orillaA)==8 ){
                System.out.println("Esa combinación no se puede dar");
                continue;
            }
            
            if (orillaA.size()%3!=0){
                System.out.println("NO ES MULTIPLO DE 3");
                continue;
            }
            System.out.println("El número de misoneros: " + numero_misioneros(orillaA));
            System.out.println("El número de canibles: " + numero_canibales(orillaA));
            Iterator p= orillaA.iterator();
            
            while(p.hasNext()){
                System.out.println("ORILLA_A -->"+orillaA.size());
                System.out.println("ORILLA_B -->"+orillaB.size());
                
                IteradorCombinacion it = new IteradorCombinacion(orillaA, 3);
                Iterator s = it.iterator();
                while (s.hasNext()) {
                    List t= (List) s.next();
                    List<String> auxA= clone(orillaA);
                    List<String> auxB= clone(orillaB);
                    Iterator ti= t.iterator();
                    while(ti.hasNext()){
                        String auxTi= (String) ti.next();
                        auxA.remove(auxTi);
                        auxB.add(auxTi);
                    }
                    if ((numero_misioneros(t)>numero_canibales(t) || numero_misioneros(t)==0)
                            && numero_misioneros(auxA)!=1
                            && (numero_canibales(auxA)<= numero_misioneros(auxA) || numero_misioneros(auxA)==0)
                            && (numero_canibales(auxB) <= numero_misioneros(auxB))){
                        System.out.println("Combinacion ganadoras:"+ t);
                        Iterator ti2= t.iterator();
                        while(ti2.hasNext()){
                            String auxTi2=  (String) ti2.next();
                            orillaA.remove(auxTi2);
                            orillaB.add(auxTi2);
                        }
                        break;
                        
                    }
                
                }
                
            }
            long tiempoIter= System.nanoTime()-tiempoInicio;
            System.out.println("Resultado de la orilla A: "+ orillaA);
            System.out.println("Resultado de la orilla B: "+ orillaB);
            System.out.println("Tiempo en milisegundos: "+tiempoIter/1e6);
            tiempos.add(tiempoIter);
        }
        long tiempoFinal=0;
        Iterator tiempoIt= tiempos.iterator();
        while(tiempoIt.hasNext()){
            tiempoFinal+=(long)tiempoIt.next();
        }
        System.out.println("Tiempo final en segundos:" + tiempoFinal/1e9);
        
    }
}
