/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Reader;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author Hector
 */
public class FileTextReader {
    public static List<String> read(String fileName){
        List <String> vec = new LinkedList();
        File file= new File (fileName);
        try{
            try(FileReader fr = new FileReader (file)){
                BufferedReader br= new BufferedReader(fr);
                String aux;
                while((aux= br.readLine())!= null){
                    vec.add(aux);
                }
            }
        } catch(IOException e){
            System.out.println("Excepción al leer el archivo: " + e.getMessage());
        }
        return vec;
    }
    
    public static List <String> toInt(String vec){
        String [] aux= vec.split(" ");
        List <String> result = new LinkedList();
        for (String aux1 : aux) {
            result.add(aux1);
        }
        return  result;
    }
    
}
