package registerBot

import javax.swing.JFrame
import javax.swing.JButton
import javax.swing.JOptionPane
import javax.swing.ImageIcon

class CaptchaDialog {
	var JFrame parent
    def pedirCaptcha() {
        
       	parent.requestFocusInWindow
        var String captcha = JOptionPane.showInputDialog(parent,
                        "Ingrese el captcha", null);
                        parent.dispose()
                        return captcha
        
    }
    def preguntarPorMalRegistro(){
    	var int option = JOptionPane.YES_NO_OPTION
    	parent.requestFocusInWindow
    	var int resultado = JOptionPane.showConfirmDialog(null,"Quiere refrescar y intentar otra vez?","Warning",option)
    	if(resultado==JOptionPane.YES_OPTION){
    		parent.dispose()
    		return true
    	}
		if(resultado==JOptionPane.NO_OPTION){
			parent.dispose()
			return false
		}
    	 
    }
    
    def preguntarPorMailConfirmado(){
    	var int option = JOptionPane.YES_NO_OPTION
    	var int resultado = JOptionPane.showConfirmDialog(null,"Confirmo el mail?","Warning",option)
    	if(resultado==JOptionPane.YES_OPTION){
    		parent.dispose()
    		return true
    	}
		if(resultado==JOptionPane.NO_OPTION){
			parent.dispose()
			return false
		}
    	 
    }
    new(){
    	parent = new JFrame();
    	parent.visible = true;
        parent.alwaysOnTop = true;
    }
}
