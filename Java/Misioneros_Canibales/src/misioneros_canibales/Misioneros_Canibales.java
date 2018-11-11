/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package misioneros_canibales;

import Reader.FileTextReader;
import combinationsGenerator.IteradorCombinacion;
import java.util.ArrayList;
import java.util.Date;
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
        StockProcessor prueba= new StockProcessor();
        prueba.misioneros_Canibales("fichero_básico.txt");
        prueba.misioneros_CanibalesT("fichero_básico.txt");
        prueba.misioneros_CanibalesT("fichero_avanzado.txt");
        
    }
    
}
