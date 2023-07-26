import java.util.List;
import it.betacom.bean.Cliente;
import it.betacom.bean.Animale;
import it.betacom.dao.ClienteDao;
import it.betacom.dao.AnimaleDao;

public class Main {

    public static void main(String[] args) {
        // Prova il metodo getRecordById dalla classe ClienteDao
        int clientId = 1; // Inserisci l'ID del cliente che vuoi recuperare
        Cliente cliente = ClienteDao.getRecordById(clientId);
        
        if (cliente != null) {
            System.out.println("Cliente trovato:");
            System.out.println("ID: " + cliente.getId());
            System.out.println("Nome: " + cliente.getNome());
            System.out.println("Cognome: " + cliente.getCognome());
            System.out.println("Indirizzo: " + cliente.getIndirizzo());
            System.out.println("Citta: " + cliente.getCitta());
            System.out.println("Telefono: " + cliente.getTelefono());
        } else {
            System.out.println("Cliente non trovato per l'ID specificato.");
        }

        // Prova il metodo getAnimaliByClientId dalla classe AnimaleDao
        int clientIdForAnimali = 1; // Inserisci l'ID del cliente per cui vuoi recuperare gli animali
        List<Animale> listaAnimali = AnimaleDao.getAnimaliByClientId(clientIdForAnimali);
        
        if (!listaAnimali.isEmpty()) {
            System.out.println("\nAnimali del cliente con ID " + clientIdForAnimali + ":");
            for (Animale animale : listaAnimali) {
                System.out.println("ID Animale: " + animale.getId());
                System.out.println("Nome Animale: " + animale.getNome_animale());
                System.out.println("Tipo Animale: " + animale.getTipo_animale());
                System.out.println("Prezzo: " + animale.getPrezzo());
                System.out.println("----------------------");
            }
        } else {
            System.out.println("\nNessun animale trovato per il cliente con ID " + clientIdForAnimali);
        }
    }
}
