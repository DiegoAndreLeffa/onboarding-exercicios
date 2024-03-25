import cds, {Request} from '@sap/cds';

export class BookManagementService extends cds.ApplicationService {
    constructor(){
        super();
        this.before('READ', 'Books', (request) => this.beforeReadBooks)
        this.before('READ', 'Books', (request) => this.orderBooks)
        this.before('READ', 'Books', (request) => this.projectionBooks)
    }

    public async beforeReadBooks(request: Request): Promise<void> {
        const books = await cds.read('Books').where({publishedYear: { '>': 2000 } }).orderBy('publishedYear','title');
        console.log(books)
    }

    public async orderBooks(request: Request): Promise<void> {
        const orderBooks = await cds.read('Books').where({publishedYear: { '>': 2000 } }).orderBy('publishedYear','title');
        console.log(orderBooks)
    }

    public async projectionBooks(request: Request): Promise<void> {
        const projectionBooks = await cds.read('Books').columns('title', 'author').where({publishedYear: { '<': 1990 } }).orderBy('publishedYear','title');
        console.log(projectionBooks)
    }
}