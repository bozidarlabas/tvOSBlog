//
//  ConstructViewsProtocol.swift
//  tvOSApp
//
//  Created by Bozidar Labas on 30.11.2023..
//

/**
  Formalizes view construction into separate lifecycle steps:
  - creating views - creates and initializes all child views
  - styling views - sets style properties for each child view
  - lay-outing views - sets layout constraints for each view
*/
protocol ConstructViewsProtocol {

    func createViews()

    func styleViews()

    func defineLayoutForViews()

}
