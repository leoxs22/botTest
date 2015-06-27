package registerBot

import org.openqa.selenium.WebDriver
import org.openqa.selenium.firefox.FirefoxDriver
import java.util.concurrent.TimeUnit

class TestClass {
	def static void main(String[] args) {
		var WebDriver driver = new FirefoxDriver
		driver.manage().timeouts().implicitlyWait(1, TimeUnit.SECONDS)
		//ExcelManager.leerUsuario(1).registrar(driver)
		//ExcelManager.leerUsuario(2).registrar(driver)
		var Usuario usuario = new Usuario("pepe","martinez","elAdminDeEstaWebEsUnGatso2@rhyta.com","http://www.fakemailgenerator.com/#/rhyta.com/elAdminDeEstaWebEsUnGatso2/")
		usuario.registrar(driver)
		
	}
	
}