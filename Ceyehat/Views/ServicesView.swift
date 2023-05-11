//
//  ServicesView.swift
//  Ceyehat
//
//  Created by Adem Onur Çelik on 26.04.2023.
//

import SwiftUI

struct ServicesView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    HStack {
                        Image(systemName: "bed.double.fill")
                            .foregroundColor(.purple)
                            .frame(width: 60, height: 60)
                            .background(Color.purple.opacity(0.1))
                            .cornerRadius(8)
                        NavigationLink(destination: Text("Otel")) {
                            VStack(alignment: .leading) {
                                Text("Otel Rezervasyonu").font(.headline)
                                Spacer()
                                Text("En iyi otellerde konaklayın").font(.subheadline)
                            }
                            .padding(.vertical)
                            .frame(height: 100)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "car.fill")
                            .foregroundColor(.blue)
                            .frame(width: 60, height: 60)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                        NavigationLink(destination: Text("Araba")) {
                            VStack(alignment: .leading) {
                                Text("Araç Kiralama").font(.headline)
                                Spacer()
                                Text("İstediğiniz aracı kiralayın").font(.subheadline)
                            }
                            .padding(.vertical)
                            .frame(height: 100)
                        }
                    }
                    
                    
                    HStack {
                        Image(systemName: "car.side.fill")
                            .foregroundColor(.yellow)
                            .frame(width: 60, height: 60)
                            .background(Color.yellow.opacity(0.1))
                            .cornerRadius(8)
                        NavigationLink(destination: Text("Taksi")) {
                            VStack(alignment: .leading) {
                                Text("Taksi Çağırma").font(.headline)
                                Spacer()
                                Text("Hızlı ve güvenli taksi çağırın").font(.subheadline)
                            }
                            .padding(.vertical)
                            .frame(height: 100)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "map.fill")
                            .foregroundColor(.red)
                            .frame(width: 60, height: 60)
                            .background(Color.red.opacity(0.1))
                            .cornerRadius(8)
                        NavigationLink(destination: Text("Tur")) {
                            VStack(alignment: .leading) {
                                Text("Tur Organizasyonu").font(.headline)
                                Spacer()
                                Text("Heyecan verici turlara katılın").font(.subheadline)
                            }
                            .padding(.vertical)
                            .frame(height: 100)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "tram.fill")
                            .foregroundColor(.orange)
                            .frame(width: 60, height: 60)
                            .background(Color.orange.opacity(0.1))
                            .cornerRadius(8)
                        NavigationLink(destination: Text("Tren")) {
                            VStack(alignment: .leading) {
                                Text("Tren Bileti").font(.headline)
                                Spacer()
                                Text("Tren yolculuğunu deneyin").font(.subheadline)
                            }
                            .padding(.vertical)
                            .frame(height: 100)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "bag.fill")
                            .foregroundColor(.pink)
                            .frame(width: 60, height: 60)
                            .background(Color.pink.opacity(0.1))
                            .cornerRadius(8)
                        NavigationLink(destination: Text("Yemek")) {
                            VStack(alignment: .leading) {
                                Text("Yemek Servisi").font(.headline)
                                Spacer()
                                Text("Lezzetli yerel yemekler sipariş edin").font(.subheadline)
                            }
                            .padding(.vertical)
                            .frame(height: 100)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "person.fill.questionmark")
                            .foregroundColor(.teal)
                            .frame(width: 60, height: 60)
                            .background(Color.teal.opacity(0.1))
                            .cornerRadius(8)
                        NavigationLink(destination: Text("Rehber")) {
                            VStack(alignment: .leading) {
                                Text("Rehber").font(.headline)
                                Spacer()
                                Text("Profesyonel bir rehberle gezin").font(.subheadline)
                            }
                            .padding(.vertical)
                            .frame(height: 100)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "ticket.fill")
                            .foregroundColor(.orange)
                            .frame(width: 60, height: 60)
                            .background(Color.orange.opacity(0.1))
                            .cornerRadius(8)
                        NavigationLink(destination: Text("Etkinlik")) {
                            VStack(alignment: .leading) {
                                Text("Etkinlik Biletleri").font(.headline)
                                Spacer()
                                Text("Konser, tiyatro, festival ve daha fazlası").font(.subheadline)
                            }
                            .padding(.vertical)
                            .frame(height: 100)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.green)
                            .frame(width: 60, height: 60)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(8)
                        NavigationLink(destination: Text("Gezi")) {
                            VStack(alignment: .leading) {
                                Text("Gezi Planlama").font(.headline)
                                Spacer()
                                Text("Gezinizi kolaylıkla planlayın").font(.subheadline)
                            }
                            .padding(.vertical)
                            .frame(height: 100)
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                .navigationBarTitle("Hizmetler")
            }
        }
    }
}

struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesView()
    }
}

