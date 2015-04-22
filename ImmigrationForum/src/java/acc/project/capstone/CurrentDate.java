/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package acc.project.capstone;
import java.sql.Date;

public class CurrentDate {
    public static Date now() {
        return new Date(new java.util.Date().getTime());
    }
}
