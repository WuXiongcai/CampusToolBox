import { defineStore } from 'pinia';

interface ObjectList {
    [key: string]: string[];
}

export const usePermissStore = defineStore('permiss', {
    state: () => {
        const keys = localStorage.getItem('ms_keys');
        return {
            key: keys ? JSON.parse(keys) : ['14'],
            defaultList: <ObjectList>{
                admin: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16'],
                user: ['1', '2', '3', '11', '13', '14', '15', '16']
            }
        };
    },
    actions: {
        handleSet(val: string[]) {
            this.key = val;
            localStorage.setItem('ms_keys', JSON.stringify(val));
        }
    }
});
