package registerBot

import org.openqa.selenium.WebDriver
import org.openqa.selenium.WebElement
import org.openqa.selenium.By.ByClassName
import org.openqa.selenium.By
import org.openqa.selenium.support.ui.WebDriverWait
import org.openqa.selenium.support.ui.ExpectedConditions
import org.openqa.selenium.firefox.FirefoxDriver
import java.util.concurrent.TimeUnit
import org.openqa.selenium.JavascriptExecutor
import org.openqa.selenium.support.ui.Select

class Usuario {
	var nombre = ""
	var apellido = ""
	var mail = ""
	var pass = "reasada"
	var link=""
	var WebDriver driver

	new(String n, String a, String m, String l) {
		nombre = n
		apellido = a
		mail = m
		link=l
	}

	def registrar(WebDriver d) {
		this.driver = d
		/*var WebDriver driverConfirm = new FirefoxDriver
		abrirMail(driverConfirm)
		var url = Reference.HOME_URL
		driver.get(url)
		driver.manage().window().maximize()
		driver.switchTo.activeElement
		completarRegistro()
		if(confirmarMail(driverConfirm)){
			loguearYVotar()
		}*/
	// driver.close()
	// driver=null
	loguearYVotar()
	}
	
	def loguearYVotar() {
		driver.get(Reference.HOME_URL)
		var WebElement btnEntrar = driver.findElement(By.id("trigger-sesion"))
		btnEntrar.click
		var WebElement btnInversor = driver.findElement(By.id("linkSoyInversionista"))
		btnInversor.click
		var WebElement email = driver.findElement(By.id("email_inversionista"))
		email.sendKeys(mail)
		var WebElement passw = driver.findElement(By.id("clave_inversionista"))
		passw.sendKeys(pass)
		var JavascriptExecutor js
		js= driver as JavascriptExecutor
		js.executeScript("loginInversionista()")
		Thread.sleep(1000)
		new WebDriverWait(driver, 10).until(ExpectedConditions.presenceOfElementLocated(By.id("foto_inversionista")))
		driver.get(Reference.PROYECTO_URL)
		js.executeScript("verificar_invertir(483)")
		Thread.sleep(5000)
		new WebDriverWait(driver, 10).until(ExpectedConditions.presenceOfElementLocated(By.id("cuanto")))
		js.executeScript("document.getElementById(\"cuanto\").selectedIndex = 20")
		/*var Select selector = new Select(driver.findElement(By.id("cuanto")))
		selector.selectByValue("20000")*/
		var WebElement btnInvertir = driver.findElement(By.className("btnRInv"))
		btnInvertir.click
		
		
	
		
	}
	
	def abrirMail(WebDriver driverConfirm) {
		driverConfirm.get(link)
		
	}
	
	def confirmarMail(WebDriver driverConfirm) {
		driverConfirm.manage.window.maximize
		driverConfirm.switchTo.activeElement
		if(new CaptchaDialog().preguntarPorMailConfirmado){
			driverConfirm.close
			return true	
		}else{
			tirarError("No se pudo confirmar mail")
			driverConfirm.close
			return false	
			
		}
		
	}

	def completarRegistro() {
		var quiereRefrescar = true
		while (quiereRefrescar) {
			clickRegistrar()
			ponerNombre()
			ponerMail()
			ponerContraseña()
			ponerCaptcha()
			clickEnviar()
			if (!verificarCorrecto()) {
				if (new CaptchaDialog().preguntarPorMalRegistro) { // es true si el usuario quiere refrescar
					driver.get(Reference.HOME_URL)
				} else {
					quiereRefrescar = false
					tirarError("error en el registro (probablemente captcha) y no se reintentó")
				}

			} else {
				quiereRefrescar = false
			}
		}

	}

	def verificarCorrecto() {
		var WebElement verificador = driver.findElement(By.className("ctnbienvenida"))
		return verificador.displayed
	}

	def clickEnviar() {
		var WebElement btnRegistrar = driver.findElement(By.className("registrar"))
		btnRegistrar.click
	}

	def ponerCaptcha() {
		var WebElement campoCaptcha = driver.findElement(By.name("captcha"))
		var captcha = new CaptchaDialog().pedirCaptcha()
		if (campoCaptcha.displayed) {
			campoCaptcha.sendKeys(captcha)
		} else {
			tirarError("campo de captcha invalido")
		}
	}

	def ponerContraseña() {
		var WebElement campoPass = driver.findElement(By.name("clave"))
		if (campoPass.displayed) {
			campoPass.sendKeys(pass)
		} else {
			tirarError("campo de pass invalido")
		}
	}

	def ponerNombre() {
		
		var WebElement campoNombre = driver.findElement(By.id("nombre"))
		new WebDriverWait(driver, 10).until(ExpectedConditions.visibilityOf(campoNombre))
		if (campoNombre.displayed) {
			campoNombre.sendKeys(nombre + " " + apellido)
		} else {
			tirarError("campo de nombre invalido")
		}
	}

	def ponerMail() {
		var WebElement campoMail = driver.findElement(By.name("email"))
		var WebElement campoMail2 = driver.findElement(By.name("email2"))
		if (campoMail.displayed && campoMail2.displayed) {
			campoMail.sendKeys(mail)
			campoMail2.sendKeys(mail)
		} else {
			tirarError("campo de mail invalido")
		}

	}

	def clickRegistrar() {
		var WebElement btnRegistrar = driver.findElement(By.className("trigger-convocatoria"))
		btnRegistrar.click
	}

	def tirarError(String mensaje) {
		ErrorBot.tirarErrorCon("error con: " + nombre + " " + apellido + " " + mensaje)
	}
}