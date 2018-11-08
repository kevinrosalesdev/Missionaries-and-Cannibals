/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package misioneros_canibales;

import combinationsGenerator.IteradorCombinacion;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 *
 * @author Hector
 */
public class Misioneros_Canibales {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        List<String> aa = new ArrayList<>();
 
        for (int i = 1; i < 50; i++) {
            aa.add("" + i);
        }
        IteradorCombinacion it = new IteradorCombinacion(aa, 3);
        Iterator s = it.iterator();
        int contador = 1;
        List t;
        while (s.hasNext()) {
            t = ((List) (s.next()));
            System.out.print("" + contador + ","+ t.toString()+ "\n");
            contador++;
        }
    }
    
}
