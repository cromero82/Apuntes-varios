import { Injectable } from "@angular/core";
import { HttpEvent, HttpHandler, HttpInterceptor, HttpRequest, HttpResponse } from "@angular/common/http";
import { Observable, EMPTY } from "rxjs";
import { finalize } from "rxjs/operators";
import { LoaderService } from './loader.service';


@Injectable()
export class LoaderInterceptor implements HttpInterceptor {
    
    public GET = 'GET';
    public POST = 'POST';

    constructor(
        public loaderService: LoaderService
    ) { }
    private requests: HttpRequest<any>[] = [];
    removeRequest(req: HttpRequest<any>) {
        const i = this.requests.indexOf(req);
        if (i >= 0) {
            this.requests.splice(i, 1);
        }
        this.loaderService.isLoading.next(this.requests.length > 0);
    }

    isLoaded(req: HttpRequest<any>) {
        const i = this.requests.indexOf(req);
        if (i >= 0) {
            return true;
        }
        return false;
    }

    intercept(
        req: HttpRequest<any>,
        next: HttpHandler
    ): Observable<HttpEvent<any>> {
        if(this.isLoaded(req)){
            return EMPTY;
        }
        if(req.method != this.GET){
                    this.loaderService.show();
                }
        
                if(req.method != this.POST){
                    this.loaderService.show();
                }

        this.requests.push(req);
        console.log("No of requests--->" + this.requests.length);
        this.loaderService.isLoading.next(true);        
        return Observable.create(observer => {
            const subscription = next.handle(req)
                .subscribe(
                    event => {
                        if (event instanceof HttpResponse) {
                            this.removeRequest(req);
                            this.loaderService.hide();
                            observer.next(event);
                        }
                    },
                    err => {
                        //alert('error returned');
                        this.removeRequest(req);
                        this.loaderService.hide();
                        observer.error(err);
                    },
                    () => {
                        this.removeRequest(req);
                        this.loaderService.hide();
                        observer.complete();
                    });
            // remove request from queue when cancelled
            return () => {
                this.removeRequest(req);
                subscription.unsubscribe();
            };
        });

    //     if(req.method != this.GET){
    //         this.loaderService.show();
    //     }

    //     if(req.method != this.POST){
    //         this.loaderService.show();
    //     }
        
    //     return next.handle(req).pipe(
    //         finalize( () => {
    //            this.loaderService.hide();
    //         } )
    //     );
     }
}
