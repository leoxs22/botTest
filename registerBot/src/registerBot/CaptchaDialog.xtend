package registerBot

import javax.swing.JFrame
import javax.swing.JButton
import javax.swing.JOptionPane
import javax.swing.ImageIcon

class CaptchaDialog {

    def pedirCaptcha() {
        val JFrame parent = new JFrame();
       
        var String captcha = JOptionPane.showInputDialog(parent,
                        "Ingrese el captcha", null);
                        return captcha
        
    }
    def preguntarPorMalRegistro(){
    	var int option = JOptionPane.YES_NO_OPTION
    	var int resultado = JOptionPane.showConfirmDialog(null,"Quiere refrescar y intentar otra vez?","Warning",option)
    	if(resultado==JOptionPane.YES_OPTION){
    		return true
    	}
		if(resultado==JOptionPane.NO_OPTION){
			return false
		}
    	 
    }
    
    def preguntarPorMailConfirmado(){
    	var int option = JOptionPane.YES_NO_OPTION
    	var int resultado = JOptionPane.showConfirmDialog(null,"Confirmo el mail?","Warning",option)
    	if(resultado==JOptionPane.YES_OPTION){
    		return true
    	}
		if(resultado==JOptionPane.NO_OPTION){
			return false
		}
    	 
    }
}
