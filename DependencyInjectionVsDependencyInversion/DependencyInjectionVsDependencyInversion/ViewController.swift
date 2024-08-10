//
//  ViewController.swift
//  DependencyInjectionVsDependencyInversion
//
//  Created by Hyper Thread Solutions Pvt Ltd on 10/08/24.
//

import UIKit

protocol APIServiceProtocol {
    func callAPI()
}

class NetworkManagerUsingDependencyInjection{
    
    func callAPI(){
        
    }
    
    func decodeResponse(){
        //we want this method to access only within the view
        //We don't want to expose it access outside
        //SOLUTIONS
        //1.declaring it as private method
        //But it is not best solution because sometimes we may forget declaring every method as private
        //If we mix private and public methods Developers will confuse.
        
        //BEST Solution is using Dependency Inversion principle (protocols)
    }
}

class LoginViewModelUsingDependencyInjection{
    
    var networkManager:NetworkManagerUsingDependencyInjection
    
    init(networkManager: NetworkManagerUsingDependencyInjection) {
        self.networkManager = networkManager
    }
    
    func callAPIAndUpdateUI(){
        self.networkManager.callAPI()
        self.networkManager.decodeResponse() // Violating Dependency Inversion(Abstraction)
    }
        
}


class NetworkManagerUsingDependencyInversion:APIServiceProtocol{
    
    func callAPI(){
        
    }
    
    func decodeResponse(){
        //We always make sure this method won't expose to access outside
    }
}

class LoginViewModelUsingDependencyInversion{
    
    var apiService:APIServiceProtocol
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func callAPIAndUpdateUI(){
        self.apiService.callAPI()
    }
        
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Github Actions Started
        //New job added 2
    }


}

