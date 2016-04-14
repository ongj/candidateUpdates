/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

/**
 *
 * @author Lance
 */
class Alerts {

    private int idCandidates;
    private int idManagers;
    private int idAlerts;
    private String message;

    public Alerts() {
    }

    public int getIdCandidates() {
        return idCandidates;
    }

    public void setIdCandidates(int idCandidates) {
        this.idCandidates = idCandidates;
    }

    public int getIdManagers() {
        return idManagers;
    }

    public void setIdManagers(int idManagers) {
        this.idManagers = idManagers;
    }

    public int getIdAlerts() {
        return idAlerts;
    }

    public void setIdAlerts(int idAlerts) {
        this.idAlerts = idAlerts;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
