// Importa o evento 'ShowToastEvent'
// Este evento é usado para exibir mensagens de toast na interface do usuário.
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { LightningElement, api } from 'lwc';

export default class EditEmail extends LightningElement {
    // A propriedade 'recordId' que pode ser acessada publicamente.
    @api recordId;

     // O método 'handleSuccess' é chamado quando uma operação é bem-sucedida.
    handleSuccess(event) {
        // Dispara um evento 'ShowToastEvent' com uma mensagem de sucesso.
        this.dispatchEvent(new ShowToastEvent({
            title: 'Success',
            message: 'E-mail has been updated!',
            variant: 'success'
        }));
    }
}