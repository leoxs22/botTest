package registerBot

import org.openqa.selenium.WebDriver
import org.openqa.selenium.firefox.FirefoxDriver
import java.util.concurrent.TimeUnit
import org.openqa.selenium.Point
import org.openqa.selenium.Dimension

class TestClass {
	def static void main(String[] args) {
		var WebDriver driver = new FirefoxDriver
		var WebDriver driverConfirm = new FirefoxDriver
		driver.manage().timeouts().implicitlyWait(1, TimeUnit.SECONDS)
		//ajustar esto en base a resolucion de pantalla
		driver.manage.window.position = new Point(0,0)
		driver.manage.window.size = new Dimension(950,1000)
		driverConfirm.manage.window.position = new Point(951,0)
		driverConfirm.manage.window.size = new Dimension(950,1000)
		
		for(var i=20;i<30;i++){
			ExcelManager.leerUsuario(i).registrar(driver, driverConfirm)
			Thread.sleep(1000)
		}
		//ExcelManager.leerUsuario(1).registrar(driver)
		//ExcelManager.leerUsuario(2).registrar(driver)
		//var Usuario usuario = new Usuario("Juana","Azurduy","JuanaAzurduy2@rhyta.com","http://www.fakemailgenerator.com/#/rhyta.com/JuanaAzurduy2/")
		//var Usuario usuario2 = new Usuario("Marta","Zurdeña","MartaZurdena@rhyta.com","http://www.fakemailgenerator.com/#/rhyta.com/MartaZurdena/")
		//usuario.registrar(driver)
		//usuario2.registrar(driver)
		Thread.sleep(10000)//para que tenga tiempo a la ultima inversion
		driver.close()
	}
	
}