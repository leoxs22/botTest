package registerBot

import org.apache.poi.ss.usermodel.Workbook
import java.io.File
import org.apache.poi.hssf.usermodel.HSSFWorkbook
import java.io.FileInputStream
import org.apache.poi.hssf.usermodel.HSSFSheet
import org.apache.poi.hssf.usermodel.HSSFRow

class ExcelManager {
		val static final String filename ="C:\\Users\\leaa\\Desktop\\bottest.xls"
	    def private static  readFile() {
                return new HSSFWorkbook(new FileInputStream(filename))
        }
        
        def static public leerUsuario(int id){
        	var HSSFWorkbook documento =  readFile()
        	var HSSFSheet plantilla = documento.getSheetAt(0)
        	var HSSFRow fila = plantilla.getRow(id)
        	if(fila==null){
        		ErrorBot.tirarErrorCon("la fila estaba vacia en el id"+ id)
        		throw new NullPointerException
        	}
        	var nombre = fila.getCell(0).stringCellValue
        	var apellido = fila.getCell(1).stringCellValue
        	var mail = fila.getCell(2).stringCellValue
        	var link = fila.getCell(3).stringCellValue
        	
        	return new Usuario(nombre, apellido, mail, link)
        }
}